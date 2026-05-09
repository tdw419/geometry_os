; DESCRIPTION: Renders a cyan line between points (113, 168) and (333, 29).
; PLAN: r0=113(x1), r1=168(y1), r2=333(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 168
LDI r2, 333
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
