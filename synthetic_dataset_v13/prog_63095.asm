; DESCRIPTION: Composite: Creates a cyan rectangular region at (398, 1) spanning 25 by 11 pixels then Draws a white line from (307, 22) to (4, 164).
; PLAN: r0=398(x), r1=1(y), r2=25(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x1), r6=22(y1), r7=4(x2), r8=164(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 1
LDI r2, 25
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 22
LDI r7, 4
LDI r8, 164
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
