; DESCRIPTION: Places a yellow circle of radius 50 at center (344, 91).
; PLAN: r0=344(x), r1=91(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 91
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
