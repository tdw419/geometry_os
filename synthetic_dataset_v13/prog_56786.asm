; DESCRIPTION: Renders a cyan box of size 69x77 starting at (65, 113).
; PLAN: r0=65(x), r1=113(y), r2=69(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 113
LDI r2, 69
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
