; DESCRIPTION: Renders a red box of size 99x90 starting at (398, 68).
; PLAN: r0=398(x), r1=68(y), r2=99(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 68
LDI r2, 99
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
