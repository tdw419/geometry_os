; DESCRIPTION: Renders a green box of size 54x112 starting at (185, 42).
; PLAN: r0=185(x), r1=42(y), r2=54(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 42
LDI r2, 54
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
