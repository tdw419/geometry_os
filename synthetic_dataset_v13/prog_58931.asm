; DESCRIPTION: Draws a cyan line from (480, 149) to (502, 63).
; PLAN: r0=480(x1), r1=149(y1), r2=502(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 149
LDI r2, 502
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
