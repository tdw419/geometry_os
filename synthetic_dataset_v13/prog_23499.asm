; DESCRIPTION: Draws a green line from (154, 209) to (33, 166).
; PLAN: r0=154(x1), r1=209(y1), r2=33(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 209
LDI r2, 33
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
