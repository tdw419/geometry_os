; DESCRIPTION: Renders a white line between points (502, 104) and (398, 192).
; PLAN: r0=502(x1), r1=104(y1), r2=398(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 104
LDI r2, 398
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
