; DESCRIPTION: Renders a cyan box of size 67x109 starting at (79, 33).
; PLAN: r0=79(x), r1=33(y), r2=67(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 33
LDI r2, 67
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
