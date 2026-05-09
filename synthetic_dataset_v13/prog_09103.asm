; DESCRIPTION: Places a orange circle of radius 10 at center (154, 154).
; PLAN: r0=154(x), r1=154(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 154
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
