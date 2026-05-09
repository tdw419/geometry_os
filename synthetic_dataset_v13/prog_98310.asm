; DESCRIPTION: Clears the screen to orange.
; PLAN: r0=0xFF8800(color). Op: FILL r0.
LDI r0, 0xFF8800
FILL r0
HALT
