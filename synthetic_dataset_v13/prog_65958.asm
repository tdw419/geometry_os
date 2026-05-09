; DESCRIPTION: Renders a red line between points (284, 126) and (21, 177).
; PLAN: r0=284(x1), r1=126(y1), r2=21(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 126
LDI r2, 21
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
