; DESCRIPTION: Places a red 40x86 rectangle at position (166, 94).
; PLAN: r0=166(x), r1=94(y), r2=40(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 94
LDI r2, 40
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
