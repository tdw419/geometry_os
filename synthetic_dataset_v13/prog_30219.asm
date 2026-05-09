; DESCRIPTION: Renders a blue box of size 54x44 starting at (433, 36).
; PLAN: r0=433(x), r1=36(y), r2=54(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 36
LDI r2, 54
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
