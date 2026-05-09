; DESCRIPTION: Places a cyan circle of radius 73 at center (234, 154).
; PLAN: r0=234(x), r1=154(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 154
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
