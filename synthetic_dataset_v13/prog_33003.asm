; DESCRIPTION: Composite: Places a cyan circle of radius 79 at center (387, 133) then Creates a red rectangular region at (5, 150) spanning 22 by 22 pixels.
; PLAN: r0=387(x), r1=133(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=5(x), r6=150(y), r7=22(width), r8=22(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 133
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 5
LDI r6, 150
LDI r7, 22
LDI r8, 22
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
