; DESCRIPTION: Renders a cyan box of size 21x59 starting at (395, 192).
; PLAN: r0=395(x), r1=192(y), r2=21(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 192
LDI r2, 21
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
