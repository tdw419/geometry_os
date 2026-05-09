; DESCRIPTION: Renders a cyan box of size 108x110 starting at (199, 27).
; PLAN: r0=199(x), r1=27(y), r2=108(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 27
LDI r2, 108
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
