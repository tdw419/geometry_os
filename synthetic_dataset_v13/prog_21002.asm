; DESCRIPTION: Places a cyan circle of radius 50 at center (428, 174).
; PLAN: r0=428(x), r1=174(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 174
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
