; DESCRIPTION: Renders a cyan line between points (491, 239) and (264, 225).
; PLAN: r0=491(x1), r1=239(y1), r2=264(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 239
LDI r2, 264
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
