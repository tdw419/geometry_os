; DESCRIPTION: Places a blue circle of radius 16 at center (433, 174).
; PLAN: r0=433(x), r1=174(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 174
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
