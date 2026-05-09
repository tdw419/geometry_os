; DESCRIPTION: Renders a cyan box of size 14x67 starting at (405, 175).
; PLAN: r0=405(x), r1=175(y), r2=14(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 175
LDI r2, 14
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
