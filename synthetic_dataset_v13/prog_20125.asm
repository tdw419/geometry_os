; DESCRIPTION: Clears the screen to green.
; PLAN: r0=0x00FF00(color). Op: FILL r0.
LDI r0, 0x00FF00
FILL r0
HALT
