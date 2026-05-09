; DESCRIPTION: Places a blue 27x38 rectangle at position (443, 140).
; PLAN: r0=443(x), r1=140(y), r2=27(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 140
LDI r2, 27
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
