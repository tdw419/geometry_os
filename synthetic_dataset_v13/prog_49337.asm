; DESCRIPTION: Places a cyan line segment connecting (46, 33) to (262, 228).
; PLAN: r0=46(x1), r1=33(y1), r2=262(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 33
LDI r2, 262
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
