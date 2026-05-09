; DESCRIPTION: Draws a cyan line from (391, 144) to (239, 196).
; PLAN: r0=391(x1), r1=144(y1), r2=239(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 144
LDI r2, 239
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
