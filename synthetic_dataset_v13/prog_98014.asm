; DESCRIPTION: Places a green circle of radius 71 at center (404, 154).
; PLAN: r0=404(x), r1=154(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 154
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
