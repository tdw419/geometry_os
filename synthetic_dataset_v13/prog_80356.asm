; DESCRIPTION: Draws a white line from (502, 239) to (104, 151).
; PLAN: r0=502(x1), r1=239(y1), r2=104(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 239
LDI r2, 104
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
