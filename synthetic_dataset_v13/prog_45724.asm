; DESCRIPTION: Places a white circle of radius 33 at center (404, 154).
; PLAN: r0=404(x), r1=154(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 154
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
