; DESCRIPTION: Renders a cyan box of size 28x117 starting at (135, 108).
; PLAN: r0=135(x), r1=108(y), r2=28(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 108
LDI r2, 28
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
