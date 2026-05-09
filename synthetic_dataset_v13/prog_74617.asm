; DESCRIPTION: Renders a cyan box of size 40x47 starting at (398, 77).
; PLAN: r0=398(x), r1=77(y), r2=40(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 77
LDI r2, 40
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
