; DESCRIPTION: Renders a cyan box of size 33x29 starting at (450, 135).
; PLAN: r0=450(x), r1=135(y), r2=33(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 135
LDI r2, 33
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
