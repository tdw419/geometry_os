; DESCRIPTION: Renders a cyan box of size 20x68 starting at (437, 178).
; PLAN: r0=437(x), r1=178(y), r2=20(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 178
LDI r2, 20
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
