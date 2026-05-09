; DESCRIPTION: Renders a cyan box of size 26x59 starting at (277, 179).
; PLAN: r0=277(x), r1=179(y), r2=26(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 179
LDI r2, 26
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
