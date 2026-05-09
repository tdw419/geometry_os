; DESCRIPTION: Places a cyan line segment connecting (307, 178) to (386, 27).
; PLAN: r0=307(x1), r1=178(y1), r2=386(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 178
LDI r2, 386
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
