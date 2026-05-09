; DESCRIPTION: Renders a cyan box of size 91x91 starting at (269, 14).
; PLAN: r0=269(x), r1=14(y), r2=91(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 14
LDI r2, 91
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
