; DESCRIPTION: Draws a green line from (284, 120) to (445, 202).
; PLAN: r0=284(x1), r1=120(y1), r2=445(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 120
LDI r2, 445
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
