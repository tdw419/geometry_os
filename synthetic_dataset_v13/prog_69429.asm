; DESCRIPTION: Places a blue circle of radius 42 at center (229, 86).
; PLAN: r0=229(x), r1=86(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 86
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
