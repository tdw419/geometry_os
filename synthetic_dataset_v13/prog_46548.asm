; DESCRIPTION: Creates a magenta rectangular region at (398, 104) spanning 80 by 47 pixels.
; PLAN: r0=398(x), r1=104(y), r2=80(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 104
LDI r2, 80
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
