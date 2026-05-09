; DESCRIPTION: Places a cyan circle of radius 52 at center (146, 135).
; PLAN: r0=146(x), r1=135(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 135
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
