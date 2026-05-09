; DESCRIPTION: Renders a white box of size 54x58 starting at (295, 32).
; PLAN: r0=295(x), r1=32(y), r2=54(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 32
LDI r2, 54
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
