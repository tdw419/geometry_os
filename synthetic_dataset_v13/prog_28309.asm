; DESCRIPTION: Draws a cyan line from (340, 203) to (305, 240).
; PLAN: r0=340(x1), r1=203(y1), r2=305(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 203
LDI r2, 305
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
