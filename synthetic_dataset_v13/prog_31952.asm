; DESCRIPTION: Draws a red line from (346, 178) to (415, 166).
; PLAN: r0=346(x1), r1=178(y1), r2=415(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 178
LDI r2, 415
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
