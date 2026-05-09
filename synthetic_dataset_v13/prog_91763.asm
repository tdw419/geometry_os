; DESCRIPTION: Creates a orange circular shape at (255, 209) with radius 32.
; PLAN: r0=255(x), r1=209(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 209
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
