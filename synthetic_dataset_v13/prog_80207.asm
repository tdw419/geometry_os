; DESCRIPTION: Places a red circle of radius 80 at center (180, 154).
; PLAN: r0=180(x), r1=154(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 154
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
