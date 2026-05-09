; DESCRIPTION: Renders a cyan line between points (69, 231) and (405, 27).
; PLAN: r0=69(x1), r1=231(y1), r2=405(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 231
LDI r2, 405
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
