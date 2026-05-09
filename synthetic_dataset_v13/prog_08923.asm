; DESCRIPTION: Places a cyan circle of radius 16 at center (57, 174).
; PLAN: r0=57(x), r1=174(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 174
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
