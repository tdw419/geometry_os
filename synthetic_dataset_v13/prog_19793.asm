; DESCRIPTION: Renders a green box of size 61x80 starting at (422, 23).
; PLAN: r0=422(x), r1=23(y), r2=61(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 23
LDI r2, 61
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
