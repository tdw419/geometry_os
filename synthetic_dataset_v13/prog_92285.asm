; DESCRIPTION: Creates a red rectangular region at (398, 109) spanning 12 by 40 pixels.
; PLAN: r0=398(x), r1=109(y), r2=12(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 109
LDI r2, 12
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
