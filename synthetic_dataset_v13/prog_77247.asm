; DESCRIPTION: Renders a magenta line between points (342, 42) and (415, 103).
; PLAN: r0=342(x1), r1=42(y1), r2=415(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 42
LDI r2, 415
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
