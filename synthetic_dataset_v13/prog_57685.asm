; DESCRIPTION: Renders a cyan box of size 37x69 starting at (398, 130).
; PLAN: r0=398(x), r1=130(y), r2=37(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 130
LDI r2, 37
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
