; DESCRIPTION: Places a red 43x86 rectangle at position (443, 134).
; PLAN: r0=443(x), r1=134(y), r2=43(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 134
LDI r2, 43
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
