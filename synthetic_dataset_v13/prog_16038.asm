; DESCRIPTION: Creates a cyan circular shape at (95, 146) with radius 56.
; PLAN: r0=95(x), r1=146(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 146
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
