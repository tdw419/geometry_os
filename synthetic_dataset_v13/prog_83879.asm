; DESCRIPTION: Renders a cyan box of size 92x46 starting at (192, 16).
; PLAN: r0=192(x), r1=16(y), r2=92(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 16
LDI r2, 92
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
