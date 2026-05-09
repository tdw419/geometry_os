; DESCRIPTION: Creates a orange circular shape at (146, 91) with radius 47.
; PLAN: r0=146(x), r1=91(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 91
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
