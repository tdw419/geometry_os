; DESCRIPTION: Creates a cyan circular shape at (392, 120) with radius 37.
; PLAN: r0=392(x), r1=120(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 120
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
