; DESCRIPTION: Renders a cyan box of size 13x48 starting at (135, 102).
; PLAN: r0=135(x), r1=102(y), r2=13(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 102
LDI r2, 13
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
